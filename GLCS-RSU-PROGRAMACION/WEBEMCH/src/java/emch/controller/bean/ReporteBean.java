/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.ReporteManaged;
import java.io.IOException;
import java.math.BigDecimal;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Cesar
 */
@ManagedBean
@SessionScoped
public class ReporteBean extends UsuarioBean {

    private CartesianChartModel categoryModel;
    private CartesianChartModel categoryModelV;

    public ReporteBean() {
        createCategoryModel();
        categoryModelViajes();
    }

    public void irTNxAño() throws IOException {
        createCategoryModel();
        FacesContext.getCurrentInstance().getExternalContext().redirect("reportetn.xhtml");

        //createCategoryModel();
    }

    public CartesianChartModel getCategoryModel() {
        return categoryModel;
    }

    private void createCategoryModel() {
        categoryModel = new CartesianChartModel();

        ChartSeries tn = new ChartSeries();
        tn.setLabel("Total TN");

        for (int i = 1; i <= 12; i++) {
            ReporteManaged obj = new ReporteManaged();
            String mes = "0" + i;
            //double valor =  //obj.obtenerTNxMes(mes);
            //select sum(pesotn) from t_pesaje where fechapesaje between DATE('2013-05-01') and DATE('2013-05-30') 
            switch (i) {
                case 1:
                    tn.set("Enero", 1001.47);
                    break;
                case 2:
                    tn.set("Febrero", 1105.47);
                    break;
                case 3:
                    tn.set("Marzo", 807.58);
                    break;
                case 4:
                    tn.set("Abril", 755.23);
                    break;
                case 5:
                    tn.set("Mayo", 1678.96);
                    break;
                case 6:
                    tn.set("Junio", 1433.47);
                    break;
                case 7:
                    tn.set("Julio", 1874.14);
                    break;
                case 8:
                    tn.set("Agosto", 1578.64);
                    break;
                case 9:
                    tn.set("Setiembre", 1322.26);
                    break;
                case 10:
                    tn.set("Octube", 1748.45);
                    break;
                case 11:
                    tn.set("Noviembre", 1521.14);
                    break;
                case 12:
                    tn.set("Diciembre", 1911.75);
                    break;
            }

        }
        categoryModel.addSeries(tn);
    }

    private void categoryModelViajes() {
        categoryModelV = new CartesianChartModel();

        ChartSeries tn = new ChartSeries();
        tn.setLabel("Cant. Viajes");

        for (int i = 1; i <= 12; i++) {
            ReporteManaged obj = new ReporteManaged();
            String mes = "0" + i;
            //double valor =  //obj.obtenerTNxMes(mes);
            //select sum(pesotn) from t_pesaje where fechapesaje between DATE('2013-05-01') and DATE('2013-05-30') 
            switch (i) {
                case 1:
                    tn.set("Enero", 140);
                    break;
                case 2:
                    tn.set("Febrero", 155);
                    break;
                case 3:
                    tn.set("Marzo", 157);
                    break;
                case 4:
                    tn.set("Abril", 110);
                    break;
                case 5:
                    tn.set("Mayo", 162);
                    break;
                case 6:
                    tn.set("Junio", 124);
                    break;
                case 7:
                    tn.set("Julio", 120);
                    break;
                case 8:
                    tn.set("Agosto", 125);
                    break;
                case 9:
                    tn.set("Setiembre", 159);
                    break;
                case 10:
                    tn.set("Octube", 147);
                    break;
                case 11:
                    tn.set("Noviembre", 156);
                    break;
                case 12:
                    tn.set("Diciembre", 184);
                    break;
            }

        }
        categoryModelV.addSeries(tn);
    }

    /**
     * @return the categoryModelV
     */
    public CartesianChartModel getCategoryModelV() {
        return categoryModelV;
    }
}
