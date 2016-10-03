using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShieldUIGridExample.Startup))]
namespace ShieldUIGridExample
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
