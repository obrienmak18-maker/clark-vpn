import React, { useEffect, useState } from 'react';

interface User {
  id: string;
  name: string;
  email: string;
  role: string;
}

const Users: React.FC = () => {
  const [users, setUsers] = useState<User[]>(
    [ // Mock data
      { id: '1', name: 'John Doe', email: 'john.doe@example.com', role: 'user' },
      { id: '2', name: 'Jane Smith', email: 'jane.smith@example.com', role: 'admin' },
      { id: '3', name: 'Peter Jones', email: 'peter.jones@example.com', role: 'user' },
    ]
  );

  // In a real application, you would fetch users from the backend
  // useEffect(() => {
  //   const fetchUsers = async () => {
  //     try {
  //       const response = await fetch('/api/users', { headers: { 'Authorization': 'Bearer YOUR_TOKEN' } });
  //       const data = await response.json();
  //       setUsers(data.data);
  //     } catch (error) {
  //       console.error('Error fetching users:', error);
  //     }
  //   };
  //   fetchUsers();
  // }, []);

  const handleDelete = (id: string) => {
    // TODO: Implement actual delete API call
    setUsers(users.filter(user => user.id !== id));
    alert(`User ${id} deleted`);
  };

  const handleEdit = (id: string) => {
    // TODO: Implement actual edit functionality
    alert(`Edit user ${id}`);
  };

  return (
    <div>
      <h1>User Management</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>{user.id}</td>
              <td>{user.name}</td>
              <td>{user.email}</td>
              <td>{user.role}</td>
              <td>
                <button onClick={() => handleEdit(user.id)}>Edit</button>
                <button onClick={() => handleDelete(user.id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Users;
