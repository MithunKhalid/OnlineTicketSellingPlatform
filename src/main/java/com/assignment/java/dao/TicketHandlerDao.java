package com.assignment.java.dao;

import com.assignment.java.domain.Ticket;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TicketHandlerDao {

    private SqlSessionFactory sqlSessionFactory;

    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public int insertPurchaseTicketInfo( Ticket tickets){

        SqlSession session = sqlSessionFactory.openSession();
        int flag = 0;

        try {
            session.insert("ticketsMapper.insertPurchaseTicketInfo", tickets);
            session.commit();
        }
        catch (Exception ex){
            flag = 1;
            ex.printStackTrace();
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }
        return flag;
    }

    public int updatePurchaseTicketInfo( Ticket ticket) {

        SqlSession session = sqlSessionFactory.openSession();
        int flag = 0;

        try {
            session.update("ticketsMapper.updatePurchaseTicketInfo", ticket);
            session.commit();
        }
        catch (Exception ex){
            flag = 1;
            ex.printStackTrace();
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }
        return flag;
    }

    public List<Ticket> getAllTicketsInfo(){
        List<Ticket> ticketsList = new ArrayList<Ticket>();
        SqlSession session = sqlSessionFactory.openSession();
        try {
            ticketsList = session.selectList("ticketsMapper.selectAllTicketsInfo");
        }catch (Exception ex){
            System.out.println("----------exception-----"+ex);
        }finally {
            session.close();
        }
        return ticketsList;
    }

    public Ticket searchTicketsInfoByID( String ticketID) {

        SqlSession session = sqlSessionFactory.openSession();

        Ticket ticket = new Ticket();

        try {
            ticket = session.selectOne("ticketsMapper.searchTicketsInfoByID", ticketID);
            session.commit();
        }
        catch (Exception ex){
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }

        return ticket;
    }

    public List<Ticket> searchTicketsInfo( String buyerPhoneNumber) {

        SqlSession session = sqlSessionFactory.openSession();
        List<Ticket> ticketsList = new ArrayList<Ticket>();

        try {
            ticketsList = session.selectList("ticketsMapper.searchTicketsInfo", buyerPhoneNumber);
            session.commit();
        }
        catch (Exception ex){
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }

        return ticketsList;
    }

    public List<Ticket> searchTicketsInfoByType( String ticketType) {

        SqlSession session = sqlSessionFactory.openSession();
        List<Ticket> ticketsList = new ArrayList<Ticket>();

        try {
            ticketsList = session.selectList("ticketsMapper.searchTicketsInfoByType", ticketType);
            session.commit();
        }
        catch (Exception ex){
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }

        return ticketsList;
    }

    public List<String> getAllTicketsType(){
        List<String> ticketsTypeList = new ArrayList<String>();
        SqlSession session = sqlSessionFactory.openSession();
        try {
            ticketsTypeList = session.selectList("ticketsMapper.selectAllTicketsType");
        }catch (Exception ex){
            System.out.println("----------exception-----"+ex);
        }finally {
            session.close();
        }
        return ticketsTypeList;
    }

    public int updateTicketStatus( Ticket ticket) {

        SqlSession session = sqlSessionFactory.openSession();
        int flag = 0;

        try {
            session.update("ticketsMapper.updateTicketStatus", ticket);
            session.commit();
        }
        catch (Exception ex){
            flag = 1;
            ex.printStackTrace();
            System.out.println("----------exception-----"+ex);
        }
        finally {
            session.close();
        }
        return flag;
    }

    public int countTicketNumberByStatus(String ticketStatus) {
        SqlSession session = sqlSessionFactory.openSession();
        int count = 0;
        try {
            count=(Integer)session.selectOne("ticketsMapper.countTicketNumberByStatus", ticketStatus);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return count;
    }

    public int countTicketSumByStatus(String ticketStatus) {
        SqlSession session = sqlSessionFactory.openSession();
        int count = 0;
        try {
            count=(Integer)session.selectOne("ticketsMapper.countTicketSumByStatus", ticketStatus);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return count;
    }
}
