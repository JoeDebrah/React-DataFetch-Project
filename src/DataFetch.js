//Working template

import React from "react";
import useFetch from "./useFetch";

function Home() {
  const { data, isPending, error } = useFetch("https://reqres.in/api/users/");

  return (
    <div className="Test-div">
      <h1 className="h1-div">Fetched from random Api</h1>
      {error && <h1>An Error Occured</h1>}
      <table class="minimalistBlack">
        {isPending ? (
          <h1 className="pending">Pending...</h1>
        ) : (
          <thead>
            <tr>
              <th>Image</th>
              <th>Name</th>
              <th>Email</th>
            </tr>
          </thead>
        )}
        {data &&
          data.data.map((blog) => (
            <tbody>
              <tr key={blog.id} className="data-pos">
                <td>
                  <img src={blog.avatar} alt="avatars" />
                </td>
                <td>
                  {blog.first_name} {blog.last_name}
                </td>
                <td>{blog.email}</td>
              </tr>
            </tbody>
          ))}
      </table>
    </div>
  );
}
export default Home;
