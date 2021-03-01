apiVersion: apps/v1
kind: Deployment
metadata:
  name: circle-ci-cluster
  namespace: staging
  labels:
    app: ci-deploy
spec:
  replicas: 2
  selector:
    matchLabels:
      app: ci-deploy
      tier: backend
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: ci-deploy
        tier: backend
    spec:
      containers:
        - image: ${AWS_ECR_ACCOUNT_URL}/aws-ecr-demo:${CIRCLE_SHA1}
          name: backend
          imagePullPolicy: Always
          ports:
            - containerPort: 3000
              name: ci-deploy