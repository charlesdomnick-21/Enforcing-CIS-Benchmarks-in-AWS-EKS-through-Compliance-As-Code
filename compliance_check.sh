#!/bin/bash

# Get all AWS regions dynamically
ALL_REGIONS=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

echo "Checking AWS Config compliance across regions..."
echo "================================================="

for REGION in $ALL_REGIONS; do
    echo ""
    echo "Region: $REGION"
    echo "----------------------------"

    # Get all config rule names in the region
    RULES=$(aws configservice describe-config-rules --region "$REGION" \
        --query 'ConfigRules[*].ConfigRuleName' --output text)

    if [ -z "$RULES" ]; then
        echo "No AWS Config rules found in $REGION."
        continue
    fi

    for RULE in $RULES; do
        echo ""
        echo " Rule: $RULE"

        # Get overall compliance status for the rule
        OVERALL_STATUS=$(aws configservice describe-compliance-by-config-rule \
            --config-rule-names "$RULE" \
            --region "$REGION" \
            --query "ComplianceByConfigRules[0].Compliance.ComplianceType" \
            --output text)

        echo "   Overall Status: ${OVERALL_STATUS:-UNKNOWN}"

        # Get evaluated resources for the rule
        RESOURCES=$(aws configservice get-compliance-details-by-config-rule \
            --config-rule-name "$RULE" \
            --region "$REGION" \
            --query 'EvaluationResults[*].[EvaluationResultIdentifier.EvaluationResultQualifier.ResourceType, EvaluationResultIdentifier.EvaluationResultQualifier.ResourceId, ComplianceType]' \
            --output text)

        if [ -z "$RESOURCES" ]; then
            echo "   No evaluated resources found."
        else
            echo "   Resource-level compliance:"
            echo "$RESOURCES" | while read -r TYPE ID STATUS; do
                echo "     - $TYPE: $ID --> $STATUS"
            done
        fi
    done
done
