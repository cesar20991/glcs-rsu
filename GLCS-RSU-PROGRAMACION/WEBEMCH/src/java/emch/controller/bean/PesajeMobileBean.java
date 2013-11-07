/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.PesajeManaged;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class PesajeMobileBean {

    private TLiquidacion selectedLiq;
    private List<TPesaje> listarPesajesXLiq;

    public PesajeMobileBean() {
    }

    public void buscarPesajesXLiq() {
        PesajeManaged obj = new PesajeManaged();

        if (getSelectedLiq() != null) {
            listarPesajesXLiq = obj.listarPesaje(selectedLiq);
        }
    }

    public TLiquidacion getSelectedLiq() {
        return selectedLiq;
    }

    public void setSelectedLiq(TLiquidacion selectedLiq) {
        PesajeManaged obj = new PesajeManaged();
        listarPesajesXLiq = obj.listarPesaje(selectedLiq);
        this.selectedLiq = selectedLiq;
    }

    public List<TPesaje> getListarPesajesXLiq() {
        return listarPesajesXLiq;
    }

    public void setListarPesajesXLiq(List<TPesaje> listarPesajesXLiq) {
        PesajeManaged obj = new PesajeManaged();
        listarPesajesXLiq = obj.listarPesaje(selectedLiq);
        this.listarPesajesXLiq = listarPesajesXLiq;
    }
}
