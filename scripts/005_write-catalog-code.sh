# Write code for Catalog API
mkdir ./Catalog/Models

cat > ./Catalog/Models/Product.cs <<EOL
using System;

namespace Catalog.Models
{
    public class Product
    {
        public Guid ProductId { get; set; }

        public string Name { get; set; }
    }
}
EOL