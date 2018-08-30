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