/*
 * This class is created by: rajat.tak on 05/19/2020.
 * This class has different methods that perform different functions of stack.
 */
public class StackProgram {
    private List<Object> items {get; set;}
    
    /*
     * This method is creating a list which is used as stack.
     */
    public StackProgram() {
        this.items = new List<Object>();
    }
    
    /*
     * This method returns the size of stack.
     */
    public Integer size() {
        return this.items.size();
    }

    /*
     * This method returns the size of stack as 0.
     */
    public Boolean isEmpty() {
        return size() == 0;
    }
        
    /*
     * This method is used to add items to stack.
     */
    public void push(String itemToPush) {
        this.items.add(itemToPush);
    }
    
    /*
     * This method is used to remove items from stack.
     */
    public Object pop() {
        if (isEmpty()) {
            throw new StackUnderFlowException();
        }
        
        return this.items.remove(size() - 1);
    }
    
}