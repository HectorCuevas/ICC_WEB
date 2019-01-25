using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICC.Recursos
{
    public class YoReporto
    {
        public Guid Codigo { get; set; }
        public DateTime FechaHoraInicial { get; set; }
        public string Usuario { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string TipoReporte { get; set; }
        public string Departamento { get; set; }
        public string Municipio { get; set; }
        public string Barrio { get; set; }
        public string Direccion { get; set; }
        public string Comentarios { get; set; }
        public decimal GpsLatitud { get; set; }
        public decimal GpsLongitud { get; set; }
        public byte[] Imagen { get; set; }

        public String Emei { get; set; }
    }
}