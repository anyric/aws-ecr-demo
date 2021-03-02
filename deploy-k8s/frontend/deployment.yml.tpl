apiVersion: apps/v1
kind: Deployment
metadata:
  name: tech-talent-web-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
spec:
  replicas: 2
  template:
    metadata:
      labels:
        app: tech-talent-web-${DEPLOYMENT_ENVIRONMENT}
    spec:
      containers:
      - name: tech-talent-web-${DEPLOYMENT_ENVIRONMENT}
        image: ${AWS_ECR_ACCOUNT_URL}/${DEPLOYMENT_ENVIRONMENT}:${CIRCLE_SHA1}
        imagePullPolicy: Always
        ports:
        - containerPort: ${FRONT_END_PORT}
      