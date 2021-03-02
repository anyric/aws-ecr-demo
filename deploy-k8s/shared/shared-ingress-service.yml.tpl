apiVersion: apps/v1
kind: Ingress
metadata:
  name: tech-talent-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
  labels:
    app: tech-talent-${DEPLOYMENT_ENVIRONMENT}
spec:
  rules:
    - host: ${WEB_HOST_DOMAIN}
      http:
        paths:
        - backend:
            serviceName: tech-talent-web-service-${DEPLOYMENT_ENVIRONMENT}
            servicePort: 80
    - host: ${API_HOST_DOMAIN}
      http:
        paths:
        - backend:
            serviceName: tech-talent-api-service-${DEPLOYMENT_ENVIRONMENT}
            servicePort: 80
          path: /*
  tls:
  - hosts:
    - ${WEB_HOST_DOMAIN} 
    - ${API_HOST_DOMAIN} 
    secretName: ${TLS_SECRET_NAME}
    