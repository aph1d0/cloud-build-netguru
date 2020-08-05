apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-netguru
  labels:
    app: hello-netguru
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-netguru
  template:
    metadata:
      labels:
        app: hello-netguru
    spec:
      containers:
      - name: hello-netguru
        image: gcr.io/GOOGLE_CLOUD_PROJECT/hello-netguru:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: hello-netguru
spec:
  selector:
    app: hello-netguru
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
