apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: circle-autoscaler
  namespace: staging
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: circle-autoscaler
  minReplicas: 2
  maxReplicas: 4
  targetCPUUtilizationPercentage: 70
