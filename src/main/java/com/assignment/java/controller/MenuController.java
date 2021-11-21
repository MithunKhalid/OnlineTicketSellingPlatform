package com.assignment.java.controller;

import com.assignment.java.dao.TicketHandlerDao;
import com.assignment.java.domain.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/menu")
public class MenuController {

    private TicketHandlerDao ticketHandlerDao;

    @Autowired
    public void setTicketHandlerDao(TicketHandlerDao ticketHandlerDao) {
        this.ticketHandlerDao = ticketHandlerDao;
    }

    @RequestMapping(value ="/addNewTickets", method = RequestMethod.GET)
    private String addNewTickets(ModelMap model) {

        Ticket ticket = new Ticket();
        List<String> ticketTypeList = ticketHandlerDao.getAllTicketsType();
        model.addAttribute("ticket", ticket);
        model.addAttribute("ticketTypeList", ticketTypeList);
        return "addTickets";

    }

    @RequestMapping(value ="/showTicketsList", method = RequestMethod.GET)
    private String modifyTickets(ModelMap model) {

        Ticket ticket = new Ticket();
        List<String> ticketTypeList = ticketHandlerDao.getAllTicketsType();
        model.addAttribute("ticket", ticket);
        model.addAttribute("ticketTypeList", ticketTypeList);
        return "ticketList";

    }

    @RequestMapping(value ="/selectTicket/{id}" ,method = RequestMethod.GET)
    private String selectTicket(@PathVariable String id, ModelMap model){

        System.out.println("---------selectTicket------"+id);
        Ticket ticket = ticketHandlerDao.searchTicketsInfoByID(id);
        System.out.println("---------getTicketType------"+ticket.getTicketType());
        model.addAttribute("ticket", ticket);
        return "modifyTickets";
    }

    @RequestMapping(value ="/searchTicket" ,method = RequestMethod.GET)
    private String searchTicket(ModelMap model){

        Ticket ticket = new Ticket();
        model.addAttribute("ticket", ticket);
        return "searchTickets";
    }

    @RequestMapping(value ="/searchTicket" ,method = RequestMethod.POST)
    private String searchTicketByPhoneNumber(@ModelAttribute("ticket") Ticket ticket, ModelMap model){

        List<Ticket> ticketList = ticketHandlerDao.searchTicketsInfo(ticket.getBuyerPhoneNumber());
        System.out.println("---------ticketTypeList------"+ticketList.size());
        model.addAttribute("ticketList", ticketList);
        return "searchResultList";
    }

    @RequestMapping(value ="/searchTicketByType" ,method = RequestMethod.GET)
    private String searchTicketByType(ModelMap model){
        Ticket ticket = new Ticket();
        List<String> ticketTypeList = ticketHandlerDao.getAllTicketsType();
        model.addAttribute("ticket", ticket);
        model.addAttribute("ticketTypeList", ticketTypeList);
        return "filterTicket";
    }

    @RequestMapping(value ="/filterTicket" ,method = RequestMethod.POST)
    private String searchTicketByType(@ModelAttribute("ticket") Ticket ticket, ModelMap model){

        List<Ticket> ticketList = ticketHandlerDao.searchTicketsInfoByType(ticket.getTicketType());
        System.out.println("---------ticketType------"+ticket.getTicketType());
        System.out.println("---------ticketTypeList------"+ticketList.size());
        model.addAttribute("ticketList", ticketList);
        return "searchResultList";
    }

    @RequestMapping(value ="/purchaseTicket/{id}" ,method = RequestMethod.GET)
    private String purchaseTicket(@PathVariable String id, ModelMap model){

        System.out.println("---------selectTicket------"+id);
        Ticket ticket = ticketHandlerDao.searchTicketsInfoByID(id);
        System.out.println("---------getTicketType------"+ticket.getTicketType());
        model.addAttribute("ticket", ticket);
        return "purchase";
    }

    @RequestMapping(value ="/report" ,method = RequestMethod.GET)
    private String report(ModelMap model){

        int purchaseCount = ticketHandlerDao.countTicketNumberByStatus("Purchase");
        int refundCount = ticketHandlerDao.countTicketNumberByStatus("Refund");
        int newCount = ticketHandlerDao.countTicketNumberByStatus("New");
        int purchaseSUM = ticketHandlerDao.countTicketSumByStatus("Purchase");
        int refundSUM = ticketHandlerDao.countTicketSumByStatus("Refund");
        model.addAttribute("purchaseCount", purchaseCount);
        model.addAttribute("refundCount", refundCount);
        model.addAttribute("newCount", newCount);
        model.addAttribute("purchaseSUM", purchaseSUM);
        model.addAttribute("refundSUM", refundSUM);
        return "report";
    }
}
