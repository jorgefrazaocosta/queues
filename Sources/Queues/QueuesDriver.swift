/// A new driver for Queues
public protocol QueuesDriver: Sendable {
    /// Create or look up a named ``Queue`` instance.
    ///
    /// - Parameter context: The context for jobs on the queue. Also provides the queue name.
    func makeQueue(with context: QueueContext) -> any Queue
    
    /// Create or look up a named ``Queue`` instance.
    ///
    /// - Parameter context: The context for jobs on the queue. Also provides the queue name.
    func makeAsyncQueue(with context: QueueContext) -> any AsyncQueue
    
    /// Shuts down the driver
    func shutdown()
    
    /// Shut down the driver asynchronously. Helps avoid calling `.wait()`
    func asyncShutdown() async
}

extension QueuesDriver {
    public func asyncShutdown() async {
        self.shutdown()
    }
}
