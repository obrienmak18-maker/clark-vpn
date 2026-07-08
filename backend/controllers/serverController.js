const Server = require("../models/Server");

// @desc    Get all servers
// @route   GET /api/servers
// @access  Private
exports.getServers = async (req, res) => {
  try {
    const servers = await Server.find();
    res.status(200).json({ success: true, data: servers });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};

// @desc    Add a server
// @route   POST /api/servers
// @access  Private
exports.addServer = async (req, res) => {
  try {
    const server = await Server.create(req.body);
    res.status(201).json({ success: true, data: server });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// @desc    Update a server
// @route   PUT /api/servers/:id
// @access  Private
exports.updateServer = async (req, res) => {
  try {
    let server = await Server.findById(req.params.id);

    if (!server) {
      return res.status(404).json({ success: false, message: "Server not found" });
    }

    server = await Server.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    res.status(200).json({ success: true, data: server });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// @desc    Delete a server
// @route   DELETE /api/servers/:id
// @access  Private
exports.deleteServer = async (req, res) => {
  try {
    const server = await Server.findById(req.params.id);

    if (!server) {
      return res.status(404).json({ success: false, message: "Server not found" });
    }

    await server.deleteOne();

    res.status(200).json({ success: true, data: {} });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};
