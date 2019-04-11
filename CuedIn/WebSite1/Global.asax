<%@ Application Language="C#" %>
<%@ Import Namespace="WebSite1" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Quartz1" %>


<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {

        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        Scheduler sch = new Scheduler();
        sch.Start(DateTime.Now);
    }

</script>
