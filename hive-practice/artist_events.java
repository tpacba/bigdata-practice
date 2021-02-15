// ORM class for table 'artist_events'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Feb 15 11:46:46 EST 2021
// For connector: org.apache.sqoop.manager.OracleManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class artist_events extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private java.math.BigDecimal event_id;
  public java.math.BigDecimal get_event_id() {
    return event_id;
  }
  public void set_event_id(java.math.BigDecimal event_id) {
    this.event_id = event_id;
  }
  public artist_events with_event_id(java.math.BigDecimal event_id) {
    this.event_id = event_id;
    return this;
  }
  private String event_name;
  public String get_event_name() {
    return event_name;
  }
  public void set_event_name(String event_name) {
    this.event_name = event_name;
  }
  public artist_events with_event_name(String event_name) {
    this.event_name = event_name;
    return this;
  }
  private java.sql.Timestamp event_date;
  public java.sql.Timestamp get_event_date() {
    return event_date;
  }
  public void set_event_date(java.sql.Timestamp event_date) {
    this.event_date = event_date;
  }
  public artist_events with_event_date(java.sql.Timestamp event_date) {
    this.event_date = event_date;
    return this;
  }
  private java.math.BigDecimal artist_id;
  public java.math.BigDecimal get_artist_id() {
    return artist_id;
  }
  public void set_artist_id(java.math.BigDecimal artist_id) {
    this.artist_id = artist_id;
  }
  public artist_events with_artist_id(java.math.BigDecimal artist_id) {
    this.artist_id = artist_id;
    return this;
  }
  private String city;
  public String get_city() {
    return city;
  }
  public void set_city(String city) {
    this.city = city;
  }
  public artist_events with_city(String city) {
    this.city = city;
    return this;
  }
  private String state;
  public String get_state() {
    return state;
  }
  public void set_state(String state) {
    this.state = state;
  }
  public artist_events with_state(String state) {
    this.state = state;
    return this;
  }
  private String country;
  public String get_country() {
    return country;
  }
  public void set_country(String country) {
    this.country = country;
  }
  public artist_events with_country(String country) {
    this.country = country;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof artist_events)) {
      return false;
    }
    artist_events that = (artist_events) o;
    boolean equal = true;
    equal = equal && (this.event_id == null ? that.event_id == null : this.event_id.equals(that.event_id));
    equal = equal && (this.event_name == null ? that.event_name == null : this.event_name.equals(that.event_name));
    equal = equal && (this.event_date == null ? that.event_date == null : this.event_date.equals(that.event_date));
    equal = equal && (this.artist_id == null ? that.artist_id == null : this.artist_id.equals(that.artist_id));
    equal = equal && (this.city == null ? that.city == null : this.city.equals(that.city));
    equal = equal && (this.state == null ? that.state == null : this.state.equals(that.state));
    equal = equal && (this.country == null ? that.country == null : this.country.equals(that.country));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.event_id = JdbcWritableBridge.readBigDecimal(1, __dbResults);
    this.event_name = JdbcWritableBridge.readString(2, __dbResults);
    this.event_date = JdbcWritableBridge.readTimestamp(3, __dbResults);
    this.artist_id = JdbcWritableBridge.readBigDecimal(4, __dbResults);
    this.city = JdbcWritableBridge.readString(5, __dbResults);
    this.state = JdbcWritableBridge.readString(6, __dbResults);
    this.country = JdbcWritableBridge.readString(7, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeBigDecimal(event_id, 1 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(event_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(event_date, 3 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(artist_id, 4 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(city, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(state, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(country, 7 + __off, 12, __dbStmt);
    return 7;
  }
  public void readFields(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.event_id = null;
    } else {
    this.event_id = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.event_name = null;
    } else {
    this.event_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.event_date = null;
    } else {
    this.event_date = new Timestamp(__dataIn.readLong());
    this.event_date.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.artist_id = null;
    } else {
    this.artist_id = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.city = null;
    } else {
    this.city = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.state = null;
    } else {
    this.state = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.country = null;
    } else {
    this.country = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.event_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.event_id, __dataOut);
    }
    if (null == this.event_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, event_name);
    }
    if (null == this.event_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.event_date.getTime());
    __dataOut.writeInt(this.event_date.getNanos());
    }
    if (null == this.artist_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.artist_id, __dataOut);
    }
    if (null == this.city) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, city);
    }
    if (null == this.state) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, state);
    }
    if (null == this.country) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, country);
    }
  }
  private final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(event_id==null?"null":event_id.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(event_name==null?"null":event_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(event_date==null?"null":"" + event_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(artist_id==null?"null":artist_id.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(city==null?"null":city, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(state==null?"null":state, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(country==null?"null":country, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  private final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str;
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.event_id = null; } else {
      this.event_id = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.event_name = null; } else {
      this.event_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.event_date = null; } else {
      this.event_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.artist_id = null; } else {
      this.artist_id = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.city = null; } else {
      this.city = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.state = null; } else {
      this.state = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.country = null; } else {
      this.country = __cur_str;
    }

  }

  public Object clone() throws CloneNotSupportedException {
    artist_events o = (artist_events) super.clone();
    o.event_date = (o.event_date != null) ? (java.sql.Timestamp) o.event_date.clone() : null;
    return o;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("event_id", this.event_id);
    __sqoop$field_map.put("event_name", this.event_name);
    __sqoop$field_map.put("event_date", this.event_date);
    __sqoop$field_map.put("artist_id", this.artist_id);
    __sqoop$field_map.put("city", this.city);
    __sqoop$field_map.put("state", this.state);
    __sqoop$field_map.put("country", this.country);
    return __sqoop$field_map;
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("event_id".equals(__fieldName)) {
      this.event_id = (java.math.BigDecimal) __fieldVal;
    }
    else    if ("event_name".equals(__fieldName)) {
      this.event_name = (String) __fieldVal;
    }
    else    if ("event_date".equals(__fieldName)) {
      this.event_date = (java.sql.Timestamp) __fieldVal;
    }
    else    if ("artist_id".equals(__fieldName)) {
      this.artist_id = (java.math.BigDecimal) __fieldVal;
    }
    else    if ("city".equals(__fieldName)) {
      this.city = (String) __fieldVal;
    }
    else    if ("state".equals(__fieldName)) {
      this.state = (String) __fieldVal;
    }
    else    if ("country".equals(__fieldName)) {
      this.country = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
}
