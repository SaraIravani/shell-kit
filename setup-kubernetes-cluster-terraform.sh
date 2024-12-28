# Define base directory
PROJECT_DIR="terraform-k8s-cluster-aws"

# Create project directory
mkdir -p  $PROJECT_DIR
cd  $PROJECT_DIR || exit
# Create subdirectories
mkdir -p modules/{vpc,security-groups,master-nodes,worker-nodes,storage-nodes,etcd-nodes,haproxy-keeplived,outputs} \
         scripts \
         environments/{dev,QA,staging,production}
# Create Terraform files
touch main.tf variables.tf outputs.tf providers.tf terraform.tfvars
# Create environment-specific files
for env in dev QA staging production; do
  mkdir -p environments/$env
  touch environments/$env/backend.tfvars
  touch environments/$env/terraform.tfvars
  touch environments/$env/variables.tf
done
# Create module-specific files
for module in vpc security-groups master-nodes worker-nodes storage-nodes etcd-nodes haproxy-keeplived outputs; do
  mkdir -p modules/$module
  touch modules/$module/main.tf
  touch modules/$module/variables.tf
  touch modules/$module/outputs.tf
  touch modules/$module/providers.tf
done
# Create scripts for bootstrapping nodes
touch scripts/bootstrap-master.sh
touch scripts/bootstrap-worker.sh
touch scripts/bootstrap-storage.sh
touch scripts/bootstrap-etcd.sh
touch scripts/bootstrap-haproxy-keeplived.sh
touch scripts/setup-k8s.sh
# Print success message
echo "Project structure for Terraform Kubernetes cluster created successfully!"
