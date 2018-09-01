using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Ocelot.Middleware;
using Ocelot.DependencyInjection;

namespace Gateway
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args)
        {
            return WebHost.CreateDefaultBuilder(args)
                          .UseStartup<Startup>()
                          .ConfigureAppConfiguration((hostingContext, config) =>
                          {
                              config.AddJsonFile("ocelot.json")
                              .AddEnvironmentVariables();
                          })
                          .ConfigureServices(s =>
                          {
                              s.AddOcelot();
                          })
                          .ConfigureLogging((hostingContext, logging) =>
                          {
                              //add your logging
                          })
                          .UseIISIntegration()
                          .Configure(app =>
                          {
                              app.UseOcelot().Wait();
                          })
                          .Build();
        }
    }
}
