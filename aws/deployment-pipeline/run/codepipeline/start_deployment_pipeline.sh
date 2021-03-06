#!/usr/bin/env bash

set -euo pipefail

while getopts ":n:" opt; do
  case ${opt} in
    n) application_name="${OPTARG}"
    ;;
    \?) echo "Invalid option -${OPTARG}" >&2
    exit 1
    ;;
  esac
done

set -x

pipeline_execution_id=`aws codepipeline start-pipeline-execution --name ${application_name}-deployment-pipeline | jq -r .pipelineExecutionId`

echo "pipeline_execution_id: ${pipeline_execution_id}"
