# ============================
# ✅ TOOLS
# ============================
CC = x86_64-w64-mingw32-gcc
RC = x86_64-w64-mingw32-windres

# ============================
# ✅ PATH & FLAGS
# ============================
INCLUDE_DIR = -I./include
CFLAGS = -O3 -std=c99 -DUNICODE -D_UNICODE -DCOBJMACROS -D_WIN32_IE=0x0500 -DWINVER=0x500 -Wall
LDFLAGS = -s -lcomctl32 -lgdi32 -lole32 -luuid -Wl,--subsystem,windows

# ============================
# ✅ FILES
# ============================
OBJS = obj/main.o obj/content_view.o obj/toolbar.o obj/navbar.o obj/treeview.o obj/sizebar.o obj/statusbar.o obj/file_node.o obj/file_actions.o obj/file_utils.o obj/input_dialog.o obj/resource.o

EXECUTABLE = wfm.exe

# ============================
# ✅ RULES
# ============================
all: app

app: $(OBJS)
	$(CC) -o $(EXECUTABLE) $(OBJS) $(LDFLAGS)

obj:
	mkdir -p obj

obj/%.o: src/%.c obj
	$(CC) $(CFLAGS) $(INCLUDE_DIR) -c $< -o $@

obj/resource.o: res/resource.rc res/Application.manifest res/main.ico res/go.ico res/refresh.ico res/search.ico res/nav_arrow.ico res/up.ico res/copy.ico res/cut.ico res/paste.ico res/delete.ico res/new_folder.ico res/new_file.ico include/resource.h
	$(RC) $(INCLUDE_DIR) -I./res -i $< -o $@

clean:
	rm -f obj/*.o $(EXECUTABLE)
