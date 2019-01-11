# Export the API token
export DO_PAT=$PT_token

# Create and move to project directory
mkdir -p /home/projects/$PT_project
cd /home/projects/$PT_project

# Create the terraform file
cat << EOF > /tmp/terraform.tf

variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

# Create a server
resource "digitalocean_droplet" "$PT_project" {
  resource "digitalocean_droplet" "$PT_project" {
  image  = "ubuntu-18-04-x64"
  name   = "$PT_project"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}

output "droplet_ip" {
	value = "${resource.digitalocean_droplet.$PT_project.ipv4_address
}"
EOF
