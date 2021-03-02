apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
  minReplicas: 2
  maxReplicas: 4
  targetCPUUtilizationPercentage: 70
