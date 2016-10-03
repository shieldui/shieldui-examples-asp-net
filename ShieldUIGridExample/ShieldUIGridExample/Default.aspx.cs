using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ShieldUIGridExample
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				var scriptReference = new ScriptReference("//demos.shieldui.com/Content/Json/gridData.js");
				var mgr = ScriptManager.GetCurrent(this.Page);
				mgr.Scripts.Add(scriptReference);
			}
		}
	}
}