package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestRouteTablesModule(t *testing.T) {
	t.Parallel()

	// Định nghĩa các biến cần thiết cho module route tables
	terraformOptions := &terraform.Options{
		// Chỉ đường dẫn tới module route tables
		TerraformDir: "../",

		// Các biến cần thiết cho route tables
		Vars: map[string]interface{}{
			"vpc_id":             "vpc-05e3c2872d2aa079a", // ID của VPC mà route tables thuộc về
			"public_subnet_id":   "subnet-0c573f31ec1e73b0d", // Public Subnet ID
			"private_subnet_id":  "subnet-0e85ebb7e82205263", // Private Subnet ID
            "internet_gateway_id":   "igw-0db770a6d0970eb4c",  // Thêm giá trị cho internet_gateway_id
            "nat_gateway_id":        "nat-067bc92ecf3f143f6", 
		},
	}

	// Clean up các resource khi test xong
	defer terraform.Destroy(t, terraformOptions)

	// Thực thi `terraform init` và `terraform apply` với các thiết lập trên
	terraform.InitAndApply(t, terraformOptions)

	// Kiểm tra kết quả output của Terraform
	publicRouteTableID := terraform.Output(t, terraformOptions, "public_route_table_id")
	privateRouteTableID := terraform.Output(t, terraformOptions, "private_route_table_id")

	// Xác nhận rằng các giá trị output không rỗng (nghĩa là route table đã được tạo)
	assert.NotEmpty(t, publicRouteTableID, "Public Route Table ID should not be empty")
	assert.NotEmpty(t, privateRouteTableID, "Private Route Table ID should not be empty")

	// Thêm bất kỳ kiểm tra nào khác cần thiết để xác nhận cấu hình route tables
}
