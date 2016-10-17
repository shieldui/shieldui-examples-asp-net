using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShieldUIDashboardExample.Startup))]
namespace ShieldUIDashboardExample
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
        }
    }
}
