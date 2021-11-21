package com.assignment.java.controller;

import com.assignment.java.dao.TicketHandlerDao;
import com.assignment.java.domain.Ticket;
import com.assignment.java.domain.Tickets;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/tickets")
public class TicketPurchaseController {


    private TicketHandlerDao ticketHandlerDao;

    @Autowired
    public void setTicketHandlerDao(TicketHandlerDao ticketHandlerDao) {
        this.ticketHandlerDao = ticketHandlerDao;
    }


    @RequestMapping(value ="/getAllTicketsInfo", method = RequestMethod.GET,  produces = "application/json")
    public @ResponseBody
    Tickets getAllTicketsInfo()
    {
        List<Ticket> ticketsList = ticketHandlerDao.getAllTicketsInfo();
        System.out.println("------select-----"+ticketsList.size());
        Tickets tickets = new Tickets();
        tickets.setTickets(ticketsList);

        return tickets;

    }

    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @RequestMapping(value ="/insertTicketsInfo", method = RequestMethod.POST,  produces = "application/json")
    public @ResponseBody
    Ticket insertTicketsInfo(@RequestBody Ticket jsonString)
    {
        String uid = RandomStringUtils.randomAlphanumeric(10);
        System.out.println("------insert-----"+uid);
        System.out.println("------Phone-----"+jsonString.getBuyerPhoneNumber());
        System.out.println("------Location-----"+jsonString.getLocation() );
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        String strDate = dateFormat.format(date);
        System.out.println("------strDate-----"+strDate);
        jsonString.setTicketID(uid);
        jsonString.setTicketIssuer("Khalid");
        jsonString.setTicketIssueDate(strDate);
        jsonString.setTicketStatus("New");
        int flag = ticketHandlerDao.insertPurchaseTicketInfo(jsonString);

        if(flag==0){
            jsonString.setResponseMsg("Ticket saved successfully");
        }
        else{
            jsonString.setResponseMsg("An error occurred. Please contact with the admin");
        }


        return jsonString;

    }

    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @RequestMapping(value ="/updateTicketsInfo/{id}", method = RequestMethod.POST,  produces = "application/json")
    public @ResponseBody
    Ticket updateTicketsInfo(@PathVariable String id, @RequestBody Ticket jsonString)
    {
        System.out.println("------update-----"+id);
        System.out.println("------type-----"+jsonString.getTicketType());
        System.out.println("------ID-----"+jsonString.getTicketID());
        /*Ticket ticket = new Ticket();
        ticket.setTicketID(id);
        ticket.setTicketType("Train");
        ticket.setTicketBuyer("EFGH");
        ticket.setTicketIssuer("Khalid");
        ticket.setTicketPrice(2000);
        ticket.setTicketExpiryDate(new Date());
        ticket.setTicketIssueDate(new Date());

        ticketHandlerDao.updatePurchaseTicketInfo(ticket);

        return ticket;*/


        jsonString.setTicketIssuer("Khalid");

        int flag = ticketHandlerDao.updatePurchaseTicketInfo(jsonString);

        if(flag==0){
            jsonString.setResponseMsg("Ticket updated successfully");
        }
        else{
            jsonString.setResponseMsg("An error occurred. Please contact with the admin");
        }

        return jsonString;

    }

    @RequestMapping(value ="/searchTicketsInfo/{id}", method = RequestMethod.GET,  produces = "application/json")
    public @ResponseBody
    Ticket searchTicketsInfo(@PathVariable String id)
    {
        System.out.println("------search-----"+id);
        Ticket ticket = ticketHandlerDao.searchTicketsInfoByID(id);

        return ticket;

    }

    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @RequestMapping(value ="/updateTicketsInfoByStatus/{id}", method = RequestMethod.POST,  produces = "application/json")
    public @ResponseBody
    Ticket updateTicketsInfoByStatus(@PathVariable String id, @RequestBody Ticket jsonString)
    {
        System.out.println("------update-----"+id);
        System.out.println("------type-----"+jsonString.getTicketType());
        System.out.println("------ID-----"+jsonString.getTicketID());


        jsonString.setTicketIssuer("Khalid");

        int flag = ticketHandlerDao.updateTicketStatus(jsonString);

        if(flag==0){
            jsonString.setResponseMsg("Ticket refunded successfully");
        }
        else{
            jsonString.setResponseMsg("An error occurred. Please contact with the admin");
        }

        return jsonString;

    }
}
