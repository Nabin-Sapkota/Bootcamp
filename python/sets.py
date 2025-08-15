# Provider IDs with duplicates removed
provider_ids = {"P001", "P002", "P003"}

# Add new provider
provider_ids.add("P004")

# Remove provider
provider_ids.remove("P002")

# Membership check
print("P003" in provider_ids)  # Output: True
