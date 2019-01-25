using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICC.Recursos
{
    public class cTransaccionDet
    {
        public Guid Codigo { get; set; }
        public int NoCorrelativo { get; set; }
        public decimal MedicionBaseInicial { get; set; }
        public decimal MedicionBaseFinal { get; set; }
        public decimal SectorMetros { get; set; }
        public decimal Area { get; set; }
        public decimal Revoluciones { get; set; }
        public decimal Velocidad { get; set; }
        public decimal Caudal { get; set; }
    }
}