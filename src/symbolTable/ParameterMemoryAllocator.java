package symbolTable;

import javafx.util.Builder;

import java.util.ArrayList;
import java.util.List;

public class ParameterMemoryAllocator implements MemoryAllocator {
    MemoryAccessMethod accessor;
    final int startingOffset;
    int currentOffset;
    int minOffset;
    String baseAddress;
    List<Integer> bookmarks;

    public ParameterMemoryAllocator(MemoryAccessMethod accessor, String baseAddress, int startingOffset) {
        this.accessor = accessor;
        this.baseAddress = baseAddress;
        this.startingOffset = startingOffset;
        this.currentOffset = startingOffset;
        this.minOffset = startingOffset;
        this.bookmarks = new ArrayList<Integer>();
    }

    public ParameterMemoryAllocator(MemoryAccessMethod accessor, String baseAddress) {
        this(accessor, baseAddress, 0);
    }

    @Override
    public MemoryLocation allocate(int sizeInBytes) {
        currentOffset -= sizeInBytes;
        return new MemoryLocation(accessor, baseAddress, currentOffset - minOffset);
    }

    public void setMin(int minOffset) {
        this.minOffset = minOffset;
    }

    @Override
    public String getBaseAddress() {
        return baseAddress;
    }

    @Override
    public int getMaxAllocatedSize() {
        return startingOffset - minOffset;
    }

    @Override
    public void saveState() {
        bookmarks.add(currentOffset);
    }

    @Override
    public void restoreState() {
        assert bookmarks.size() > 0;
        int bookmarkIndex = bookmarks.size() - 1;
        currentOffset = (int) bookmarks.remove(bookmarkIndex);
    }
}
