using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Four.Entity;
using Three.Business;
/// <summary>
/// Summary description for DisplayLocation
/// </summary>
/// 
    [WebService(Namespace = "http://opts-locations.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService()]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DisplayLocation : System.Web.Services.WebService
    {
        public DisplayLocation()
        {
            //Uncomment the following line if using designed components 
            //InitializeComponent(); 
        }

        [WebMethod]
        [ScriptMethod]
        public string[] SearchLocation(string MC, int count)
        {
            IEnumerable<ENLocation> temp = new BSLocation().SearchLocation(MC + "%");
            return temp.Select(x => x.Loc_Desc).ToArray();
        }

        [WebMethod]
        public string DisplayLocationByZipCode(decimal ZipCode)
        {
            return new BSLocation().LocationByZipCode(ZipCode).Loc_Province.ToString();
        }

        [WebMethod]
        public string DisplayProvince(int ID)
        {
            return new BSProvince().ProvinceByID(ID).Province_Desc.ToString();
        }

        [WebMethod]
        public string GetServerTime()
        {

            string serverTime =
                String.Format("The current time is {0}.", DateTime.Now);
            return serverTime;
        }

    }
