rule "terraform_required_version" {
    enabled = false
}

rule "terraform_required_providers" {
    enabled = false
}
 
rule "terraform_naming_convention" {
    enabled = true
}

rule "terraform_unused_declarations" {
    enabled = true
}   

rule "terraform_typed_variables" {
    enabled = true
}
