apiVersion: apps/v1
kind: Deployment
metadata:
  name: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  labels:
    app: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
spec:
  replicas: 2
  selector:
    matchLabels:
      app: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
      tier: backend
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
        tier: backend
    spec:
      containers:
        - name: tech-talent-api-${DEPLOYMENT_ENVIRONMENT}
          image: ${AWS_ECR_ACCOUNT_URL}/${DEPLOYMENT_ENVIRONMENT}:${CIRCLE_SHA1}
          imagePullPolicy: Always
          ports:
            - containerPort: ${BACK_END_PORT}