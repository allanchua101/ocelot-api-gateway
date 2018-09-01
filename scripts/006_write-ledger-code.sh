# Write code for ledger API
mkdir ./Ledger/Models

cat > ./Ledger/Models/Transaction.cs <<EOL
using System;

namespace Ledger.Models
{
    public class Transaction
    {
        public Guid ProductID { get; set; }

        public Guid UserID { get; set; }

        public double PriceAtPointInTime { get; set; }

        public DateTime OccuredAt { get; set; }

        public double Quantity { get; set; }

        public double Total { get; set; }
    }
}
EOL

cat > ./Ledger/Controllers/TransactionController.cs <<EOL
using Ledger.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace Ledger.Controllers
{
    [Route("api/[controller]")]
    public class TransactionController : Controller
    {
        [HttpGet]
        public List<Transaction> All()
        {
            return new List<Transaction>()
            {
                new Transaction()
                {
                    ProductID = Guid.Parse("ef29fc61-abcc-4ac1-9c8c-e5e17b266868"),
                    UserID = Guid.Parse("539bf338-e5de-4fc4-ac65-4a91324d8111"),
                    OccuredAt = DateTime.Now,
                    PriceAtPointInTime = 36,
                    Quantity = 5,
                    Total = 180
                },
                new Transaction()
                {
                    ProductID = Guid.Parse("d91d2019-e642-4b00-8b10-2bf07c383787"),
                    UserID = Guid.Parse("6b2c4788-e1d5-4ef4-8edf-e7d57e31bf4f"),
                    OccuredAt = DateTime.Now,
                    PriceAtPointInTime = 36,
                    Quantity = 5,
                    Total = 180
                }
            };
        }
    }
}
EOL

mkdir ./Ledger/Properties

cat > ./Ledger/Properties/launchSettings.json <<EOL
{
  "iisSettings": {
    "windowsAuthentication": false,
    "anonymousAuthentication": true,
    "iisExpress": {
      "applicationUrl": "http://localhost:52790/",
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
      "applicationUrl": "http://localhost:52790/"
    }
  }
}
EOL

cat > ./Ledger/wwwroot/index.html <<EOL
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
<h1>Ledger Service</h1>
</body>
</html>
EOL

cat > ./Ledger/Startup.cs <<EOL
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;

namespace Ledger
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