package emch.controller.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;

@ManagedBean
@SessionScoped
public class CalendarBean {

    private Date date1;
    private Date date2;
    private Date date3;
    private Date date4;
    private Date date5;
    private Date date6;
    private Date[] dates;

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        System.out.println("date: "+date1);
        this.date1 = date1;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        System.out.println("date: "+date2);
        this.date2 = date2;
    }

    public Date getDate3() {
        return date3;
    }

    public void setDate3(Date date3) {
        System.out.println("date: "+date3);
        this.date3 = date3;
    }

    public Date getDate4() {
        return date4;
    }

    public void setDate4(Date date4) {
        System.out.println("date: "+date4);
        this.date4 = date4;
    }

    public Date getDate5() {
        return date5;
    }

    public void setDate5(Date date5) {
        System.out.println("date: "+date5);
        this.date5 = date5;
    }

    public Date getDate6() {
        return date6;
    }

    public void setDate6(Date date6) {
        System.out.println("date: "+date6);
        this.date6 = date6;
    }

    public Date[] getDates() {
        return dates;
    }

    public void setDates(Date[] dates) {
        this.dates = dates;
    }

    public List<Date> getSelectedDates() {
        if (dates != null) {
            return Arrays.asList(dates);
        } else {
            return new ArrayList<Date>();
        }
    }

    public void handleDateSelect(SelectEvent event) {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        SimpleDateFormat format = new SimpleDateFormat("d/M/yyyy");
        facesContext.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Date Selected", format.format(event.getObject())));
    }

    public TimeZone getTimeZone() {
        return TimeZone.getDefault();
    }
}