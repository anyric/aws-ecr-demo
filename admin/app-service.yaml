apiVersion: v1
kind: Service
metadata:
  name: circle-service
  namespace: staging
  labels:
    app: ci-deploy
spec:
  ports:
    - port: 3000
  selector:
    app: ci-deploy
    tier: backend
  type: LoadBalancer