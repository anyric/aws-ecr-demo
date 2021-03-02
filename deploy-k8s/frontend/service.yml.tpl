apiVersion: v1
kind: Service
metadata:
  name: tech-talent-web-service-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  labels:
    app: tech-talent-web-${DEPLOYMENT_ENVIRONMENT}
spec:
  selector:
    app: tech-talent-web-${DEPLOYMENT_ENVIRONMENT}
  type: LoadBalancer
  ports:
   - protocol: TCP
     port: 80
     targetPort: ${FRONT_END_PORT}
