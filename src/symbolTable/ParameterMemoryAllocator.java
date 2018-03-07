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

    public static class Builder {
        MemoryAccessMethod accessor;
        final int startingOffset = 0;
        int currentOffset;
        int minOffset;
        String baseAddress;
        List<Integer> bookmarks;

        public MemoryLocation allocate(int sizeInBytes) {
            currentOffset -= sizeInBytes;
            updateMin();
            return new MemoryLocation(accessor, baseAddress, currentOffset);
        }

        private void updateMin() {
            if (minOffset > currentOffset) {
                minOffset = currentOffset;
            }
        }

        public String getBaseAddress() {
            return baseAddress;
        }

        public int getMaxAllocatedSize() {
            return startingOffset - minOffset;
        }

        public void saveState() {
            bookmarks.add(currentOffset);
        }

        public void restoreState() {
            assert bookmarks.size() > 0;
            int bookmarkIndex = bookmarks.size() - 1;
            currentOffset = (int) bookmarks.remove(bookmarkIndex);
        }

        public ParameterMemoryAllocator build() {
            return new ParameterMemoryAllocator(this);
        }
    }

    private ParameterMemoryAllocator(Builder b) {
        this.accessor = b.accessor;
        this.baseAddress = b.baseAddress;
        this.startingOffset = b.startingOffset;
        this.currentOffset = b.startingOffset;
        this.minOffset = b.startingOffset;
        this.bookmarks = new ArrayList<Integer>();
    }

    @Override
    public String getBaseAddress() {
        return baseAddress;
    }

    @Override
    public MemoryLocation allocate(int sizeInBytes) {
        return null;
    }

    @Override
    public void saveState() {
        bookmarks.add(currentOffset);
    }

    @Override
    public void restoreState() {
    }

    @Override
    public int getMaxAllocatedSize() {
        return startingOffset - minOffset;
    }
}
