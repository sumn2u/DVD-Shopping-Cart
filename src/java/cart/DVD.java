package cart;

import java.io.*;

public class DVD implements Serializable {
  String m_id;
  String m_movie;
  String m_rated;
  String m_year;
  double m_price;
  int quantity;
  public DVD() {
    m_id="";
    m_movie="";
    m_rated="";
    m_year="";
    m_price=0;
    quantity=0;
  }

  public DVD(String movieId, String movieName, String movieRate, String movieYear, double moviePrice, int movieQuantity)
    {
     m_id=movieId;
     m_movie=movieName;
     m_rated=movieRate;
     m_year=movieYear;
     m_price=moviePrice;
     quantity=movieQuantity;
    }
  public void setMovie(String title) {
    m_movie=title;
  }
  public void setId(String id){
      m_id=id;
  }
  public String getId(){
      return m_id;
  }
  public String getMovie() {
    return m_movie;
  }
  public void setRating(String rating) {
    m_rated=rating;
  }
  public String getRating() {
    return m_rated;
  }
  public void setYear(String year) {
    m_year=year;
  }
  public String getYear() {
    return m_year;
  }
  public void setPrice(double p) {
    m_price=p;
  }
  public double getPrice() {
    return m_price;
  }
  public void setQuantity(int q) {
    quantity=q;
  }
  public int getQuantity() {
    return quantity;
  }
}
