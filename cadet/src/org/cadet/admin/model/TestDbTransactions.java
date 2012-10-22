/**
 * 
 */
package org.cadet.admin.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.cadet.admin.bean.BeanTest;
import org.cadet.util.model.Constants;
import org.cadet.util.model.json.JSONException;
import org.cadet.util.model.json.JSONObject;

/**
 * @author Udit Desai
 *
 */
public class TestDbTransactions {

	/**
	 * 
	 */
	public TestDbTransactions() {
		// TODO Auto-generated constructor stub

	}

	public static JSONObject getTests(Connection connection) throws SQLException, JSONException {

		Statement statement = connection.createStatement();

		ArrayList<BeanTest> result = new ArrayList<BeanTest>();
		BeanTest temp = null;

		ResultSet rs = statement.executeQuery(Constants.sqlCommands.retriveTests);
		while(rs.next()) {

			temp = new BeanTest();
			temp.setTestID(rs.getInt("Testid"));
			temp.setTestName(rs.getString("Testname"));
			temp.setType(rs.getString("Type"));
			temp.settDate(rs.getDate("Tdate").toString());
			temp.settDuration(rs.getInt("Tduration"));
			temp.setInitialDifficulty(rs.getInt("Initialdifficulty"));

			System.out.println(temp);

			result.add(temp);
		}
		rs.close();
		statement.close();

		JSONObject data = new JSONObject();
		data.put("testList",result.toArray(new BeanTest[result.size()]));

		return data;
	}
}
