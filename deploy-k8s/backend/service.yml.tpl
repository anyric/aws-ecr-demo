apiVersion: v1
kind: Service
metadata: 
  name: tech-talent-api-service-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  labels: 
    app: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
spec:
  selector:
    app: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
    tier: backend
  type: LoadBalancer
  ports:
    - port: 80
      name: http
      protocol: TCP
      targetPort: ${BACK_END_PORT}
