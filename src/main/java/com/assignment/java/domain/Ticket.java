package com.assignment.java.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="ticket")
@XmlAccessorType(XmlAccessType.NONE)
public class Ticket {

    @XmlElement(name="ticket-id")
    private String ticketID;

    @XmlElement(name="ticket-type")
    private String ticketType;

    @XmlElement(name="ticket-buyer")
    private String ticketBuyer;

    @XmlElement(name="departure-place")
    private String departurePlace;

    @XmlElement(name="destination-place")
    private String destinationPlace;

    @XmlElement(name="location")
    private String location;

    @XmlElement(name="ticket-issuer")
    private String ticketIssuer;

    @XmlElement(name="start-time")
    private String startTime;

    @XmlElement(name="ticket-issue-date")
    private String ticketIssueDate;

    @XmlElement(name="ticket-expiry-date")
    private String ticketExpiryDate;

    @XmlElement(name="ticket-price")
    private int ticketPrice;

    @XmlElement(name="ticket-buyer-phone-number")
    private String buyerPhoneNumber;

    @XmlElement(name="ticket-status")
    private String ticketStatus;

    @XmlElement(name="response-msg")
    private String responseMsg;

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getTicketBuyer() {
        return ticketBuyer;
    }

    public void setTicketBuyer(String ticketBuyer) {
        this.ticketBuyer = ticketBuyer;
    }

    public String getDeparturePlace() {
        return departurePlace;
    }

    public void setDeparturePlace(String departurePlace) {
        this.departurePlace = departurePlace;
    }

    public String getDestinationPlace() {
        return destinationPlace;
    }

    public void setDestinationPlace(String destinationPlace) {
        this.destinationPlace = destinationPlace;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTicketIssuer() {
        return ticketIssuer;
    }

    public void setTicketIssuer(String ticketIssuer) {
        this.ticketIssuer = ticketIssuer;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getTicketIssueDate() {
        return ticketIssueDate;
    }

    public void setTicketIssueDate(String ticketIssueDate) {
        this.ticketIssueDate = ticketIssueDate;
    }

    public String getTicketExpiryDate() {
        return ticketExpiryDate;
    }

    public void setTicketExpiryDate(String ticketExpiryDate) {
        this.ticketExpiryDate = ticketExpiryDate;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getBuyerPhoneNumber() {
        return buyerPhoneNumber;
    }

    public void setBuyerPhoneNumber(String buyerPhoneNumber) {
        this.buyerPhoneNumber = buyerPhoneNumber;
    }

    public String getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(String ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    public String getResponseMsg() {
        return responseMsg;
    }

    public void setResponseMsg(String responseMsg) {
        this.responseMsg = responseMsg;
    }
}
