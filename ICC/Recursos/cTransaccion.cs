using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICC.Recursos
{
    public class cTransaccion
    {
        public Guid Codigo { get; set; }
        public string Cuenca { get; set; }
        public string SubCuenca { get; set; }
        public string PuntoMonitoreo { get; set; }
        public string ModeloMolinete { get; set; }
        public string TipoMedicion { get; set; }
        public string Tipologia { get; set; }
        public decimal GpsLatitud { get; set; }
        public decimal GpsLongitud { get; set; }
        public DateTime FechaHoraInicial { get; set; }
        public DateTime FechaHoraFinal { get; set; }
        public byte[] ImagenNorte { get; set; }
        public byte[] ImagenSur { get; set; }
        public string Comentario { get; set; }
        public string Estado { get; set; }

        public decimal Caudal { get; set; }
        public string Usuario { get; set; }
    }
}