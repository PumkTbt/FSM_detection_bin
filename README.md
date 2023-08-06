# FSM_detection_bin
cyclone ii fpga, verilog, quartus ii

Điều khiển tám led đơn như sơ đồ phần cứng sau:
![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/f9bf5038-b176-4528-a2aa-4ce7d147acb7)

S = 0: 8 led sáng dần từ phải qua trái trái, thời gian hiển thị một trạng thái là 1s
S = 1: 8 led sáng đuổi từ trái qua phải, thời gian hiển thị một trạng thái là 1s
RS tích cực mức cao, khi RS tích cực thì 8 led tắt hết
CK: Xung clock đồng bộ có f = 1Hz

Phân tích:
Để có thể điều khiển 8 led sáng theo yêu cầu ta sử dụng máy trạng thái FSM để tiến hành việc mô tả phần cứng.
- Với mỗi trạng thái có thời gian hiển thị là 1s. Và xung CK đồng bộ có f=1Hz, nên xung Ck có chu kì xung là T = 1s. Do vậy, mỗi khi xung Ck xong 1 chu kì
thì led cũng sẽ xong 1 trạng thái.

![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/36965057-3b23-4769-bd54-7d1b729b7639)

![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/7baa743a-310a-4c55-b59a-b9583b7e215d)

+ s8, s7, s6, s5, s4, s3, s2, s1: Là các trạng thái led cho hiệu ứng sáng đuổi, tương ứng vị
trí sáng của các led từ trái qua phải.
+ Sd8, Sd7, Sd6, Sd5, Sd4, Sd3, Sd2, Sd1: Là 8 trạng thái led sáng dần từ phải qua trái.
+ Start: Là trạng thái bắt đầu.
+ S: Chân chọn chế độ led (0: sáng dần từ phải qua trái; 1: sáng đuổi từ trái qua phải).
Theo lược đồ này ta có thể thấy rằng, sơ lược hiệu ứng chuyển giữa sáng dần sang sáng đuổi là tất cả các led sẽ tắt hết trước khi chuyển sang hiệu ứng khác.

![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/2dfbadbd-1a46-46a7-a047-6aa36e49046a)

![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/e2d33245-1b01-470a-91ce-e60221f634cd)

![image](https://github.com/PumkTbt/FSM_detection_bin/assets/124877073/31090ced-4473-46ea-8c1f-a56d756f27f3)

Ở trường hợp kết quả này thì, ta thấy khi xung Ck tích cực cạnh lên, chân Rs mức thấp và chân chọn chế độ led S ở mức 0, thì led sáng dần. Khi đó lần lượt các led từ led[0] đến led[7] sáng, hay tích cực lên mức 1. Led ở chế độ này thì led sẽ sáng và giữ cho đến khi sáng hết 1 chu kì 8 led.
Tiếp theo, ta thấy khi mà chế độ sáng dần đến led[7], thì lúc này chân chọn chế độ S thay đổi (tích cực lên mức 1), Rs ở mức thấp. Lập tức led sẽ tắt hết (do ở đây chọn hiệu ứng
chuyển là tắt hết led khi chuyển đổi giữa hai chế độ sáng). Xong, sau đó led sẽ sáng đuổi từ led[7] về led[0] ( từ trái qua phải).
Sau khi led sáng đuổi xong, chân Rs nó tích cực lên mức cao. Thì ngay lập tức các led sẽ tắt hết hay các chân đầu ra từ led[0] đến led[7] tích cực xuống mức 0 hết.

Ở kết quả này, khi led đang sáng ở chế độ sáng đuổi thì khi chân chuyển đổi S thay đổi mức tích cực thì khi đó ngay lập tức tất cả các led nó tắt hết, và chuyển đổi chế độ
sáng. Cho dù chế độ sáng trước đó chưa hoàn thành hết 1 chu kỳ 8 led.





