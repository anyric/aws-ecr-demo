apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: activo-${DEPLOYMENT_ENVIRONMENT}
  namespace: ${DEPLOYMENT_ENVIRONMENT}
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
  labels:
    app: activo-${DEPLOYMENT_ENVIRONMENT}
spec:
  rules:
    - host: ${WEB_HOST_DOMAIN}
      http:
        paths:
        - backend:
            serviceName: activo-web-service-${DEPLOYMENT_ENVIRONMENT}
            servicePort: 80
    - host: ${API_HOST_DOMAIN}
      http:
        paths:
        - backend:
            serviceName: activo-api-service-${DEPLOYMENT_ENVIRONMENT}
            servicePort: 80
          path: /*
  tls:
  - hosts:
    - ${WEB_HOST_DOMAIN} 
    - ${API_HOST_DOMAIN} 
    secretName: ${K8S_SECRET_NAME}
    