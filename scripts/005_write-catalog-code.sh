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

cat > ./Catalog/Controllers/ProductController.cs <<EOL
using Catalog.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace Catalog.Controllers
{
    [Route("api/[controller]")]
    public class ProductController : Controller
    {
        [HttpGet]
        public List<Product> All()
        {
            return new List<Product>()
            {
                new Product() { Name = "Azure Shirt", ProductId = Guid.Parse("ef29fc61-abcc-4ac1-9c8c-e5e17b266868") },
                new Product() { Name = "ASP.net Core Shirt", ProductId = Guid.Parse("618808a6-8466-4fd8-80da-e8651ec0c0e4") },
                new Product() { Name = "Node JS Shirt", ProductId = Guid.Parse("dc2bd686-7eaf-44a3-9fdd-b3645fef9a02") },
                new Product() { Name = "Spring Shirt", ProductId = Guid.Parse("d91d2019-e642-4b00-8b10-2bf07c383787") }
            };
        }
    }
}
EOL

mkdir ./Catalog/Properties

cat > ./Catalog/Properties/launchSettings.json <<EOL
{
  "iisSettings": {
    "windowsAuthentication": false,
    "anonymousAuthentication": true,
    "iisExpress": {
      "applicationUrl": "http://localhost:52791/",
      "sslPort": 0
    }
  },
  "profiles": {
    "IIS Express": {
      "commandName": "IISExpress",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    },
    "Ledger": {
      "commandName": "Project",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      },
      "applicationUrl": "http://localhost:52791/"
    }
  }
}
EOL

cat > ./Catalog/wwwroot/index.html <<EOL
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i');
  
body, html {
    height: 100%;
    margin: 0;
    background-color: #00BFFF;
    text-align: center;
}
h1 {
 color: white;
 font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
<h1>Catalog Service</h1>
</body>
</html>
EOL

cat > ./Catalog/Startup.cs <<EOL
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;

namespace Catalog
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseDefaultFiles(new DefaultFilesOptions
            {
                DefaultFileNames = new List<string> { "index.html" }
            });
            app.UseMvc();
            app.UseStaticFiles();
        }
    }
}
EOL