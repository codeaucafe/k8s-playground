# List available recipes (this is shown when you run 'just' with no args)
default:
    @just --list

# Expose deployment as ClusterIP service
expose-service:
    kubectl expose deployment svc-test --type=ClusterIP service/svc-test exposed

# Alternative expose command
expose-deployment:
    kubectl expose deployment svc-test --type=ClusterIP

# Apply the imperative example YAML
apply-imperative:
    kubectl apply -f imperative-example.yaml

# Get all pods
get-pods:
    kubectl get pods

# Expose deployment as ClusterIP
expose-clusterip:
    kubectl expose deployment svc-test --type=ClusterIP

# Get services with wide output
get-svc-wide:
    kubectl get svc -o wide

# Clean up resources
clean:
    kubectl delete deployment svc-test --ignore-not-found=true
    kubectl delete service svc-test --ignore-not-found=true

# Run apply and then get pods
setup: apply-imperative
    @echo "Waiting for pods to start..."
    @sleep 2
    just get-pods
