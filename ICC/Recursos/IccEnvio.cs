using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICC.Recursos
{
    public class IccEnvio
    {
        public cTransaccion lobjEnce { get; set; }
        public List<cTransaccionDet> lObjDet { get; set; }
    }
}