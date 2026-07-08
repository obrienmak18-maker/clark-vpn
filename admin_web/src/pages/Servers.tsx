import React, { useEffect, useState } from 'react';

interface Server {
  id: string;
  name: string;
  location: string;
  ipAddress: string;
  status: 'active' | 'inactive' | 'maintenance';
  ping: number;
  load: number;
}

const Servers: React.FC = () => {
  const [servers, setServers] = useState<Server[]>(
    [ // Mock data
      { id: '1', name: 'US - New York', location: 'New York', ipAddress: '192.168.1.1', status: 'active', ping: 30, load: 20 },
      { id: '2', name: 'UK - London', location: 'London', ipAddress: '192.168.1.2', status: 'active', ping: 50, load: 40 },
      { id: '3', name: 'FR - Paris', location: 'Paris', ipAddress: '192.168.1.3', status: 'maintenance', ping: 60, load: 30 },
    ]
  );

  // In a real application, you would fetch servers from the backend
  // useEffect(() => {
  //   const fetchServers = async () => {
  //     try {
  //       const response = await fetch('/api/servers', { headers: { 'Authorization': 'Bearer YOUR_TOKEN' } });
  //       const data = await response.json();
  //       setServers(data.data);
  //     } catch (error) {
  //       console.error('Error fetching servers:', error);
  //     }
  //   };
  //   fetchServers();
  // }, []);

  const handleDelete = (id: string) => {
    // TODO: Implement actual delete API call
    setServers(servers.filter(server => server.id !== id));
    alert(`Server ${id} deleted`);
  };

  const handleEdit = (id: string) => {
    // TODO: Implement actual edit functionality
    alert(`Edit server ${id}`);
  };

  return (
    <div>
      <h1>Server Management</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Location</th>
            <th>IP Address</th>
            <th>Status</th>
            <th>Ping</th>
            <th>Load</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {servers.map((server) => (
            <tr key={server.id}>
              <td>{server.id}</td>
              <td>{server.name}</td>
              <td>{server.location}</td>
              <td>{server.ipAddress}</td>
              <td>{server.status}</td>
              <td>{server.ping}</td>
              <td>{server.load}</td>
              <td>
                <button onClick={() => handleEdit(server.id)}>Edit</button>
                <button onClick={() => handleDelete(server.id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Servers;
