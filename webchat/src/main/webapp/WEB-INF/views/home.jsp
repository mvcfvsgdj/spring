<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56a5ac8208747818bdaee7eb60e05ea&libraries=services"></script>

<script>
   //맨위로 올리기
   $(document).ready(function() {
      $("html, body").animate({
         scrollTop : 0
      }, 400);
      // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
      $("#myBtn").click(function() {
         $("html, body").animate({
            scrollTop : 0
         }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
      });
   });

   $(document).ready(function() {
      // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
      $(".menu-icon").click(function() {
         $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
      });
   });
   
   
   //동네 인증 script
   
   
</script>
</head>
<body>


	<header>
		<h2>Second Hands</h2>


		<!-- 모달요소 -->

		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span>
				<div id="modal-content"></div>
			</div>
		</div>

		<button id="find-me">Show my location</button>
		<br />
		<p id="status"></p>
		<a id="map-link" target="_blank"></a>
		<div id="map" style="width: 500px; height: 500px; margin-left: 50px"></div>

	</header>

	<script>
      function success(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        const status = document.querySelector("#status");
        const mapLink = document.querySelector("#map-link");

        status.textContent = "동네 인증";

        mapLink.href =
            "https://www.openstreetmap.org/#map=18/" + latitude + "/" + longitude;
          mapLink.textContent = "현재 위치 확인하기";

        var mapContainer = document.getElementById("map"),
          mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude),
            level: 3,
          };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var markerPosition = new kakao.maps.LatLng(latitude, longitude);

        var marker = new kakao.maps.Marker({
          position: markerPosition,
        });

        marker.setMap(map);
        var geocoder = new kakao.maps.services.Geocoder();

        var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });

        kakao.maps.event.addListener(map, "click", function (mouseEvent) {
          searchDetailAddrFromCoords(
            mouseEvent.latLng,
            function (result, status) {
              if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address
                  ? "<div>도로명주소 : " +
                    result[0].road_address.address_name +
                    "</div>"
                  : "";
                detailAddr +=
                  "<div>지번 주소 : " +
                  result[0].address.address_name +
                  "</div>";

                var content =
                  '<div class="bAddr">' +
                  '<span class="title">현재 주소정보</span>' +
                  detailAddr +
                  "</div>";

                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);

                infowindow.setContent(content);
                infowindow.open(map, marker);
              }
            }
          );
        });

        kakao.maps.event.addListener(map, "click", function (mouseEvent) {
            searchDetailAddrFromCoords(
              mouseEvent.latLng,
              function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                  var detailAddr = !!result[0].road_address
                    ? "<div>도로명주소 : " +
                      result[0].road_address.address_name +
                      "</div>"
                    : "";
                  detailAddr +=
                    "<div>지번 주소 : " +
                    result[0].address.address_name +
                    "</div>";

                  var content =
                    '<div class="bAddr">' +
                    '<span class="title">현재 주소정보</span>' +
                    detailAddr +
                    "</div>";

                  marker.setPosition(mouseEvent.latLng);
                  marker.setMap(map);

                  infowindow.setContent(content);
                  infowindow.open(map, marker);
                }
              }
            );
          });

        kakao.maps.event.addListener(map, "click", function (mouseEvent) {
            const newLatitude = mouseEvent.latLng.getLat();
            const newLongitude = mouseEvent.latLng.getLng();

            const newLocation = checkLocation(newLatitude, newLongitude);

            const modalContent = document.getElementById("modal-content");

            // 기존 위치 정보 업데이트
            const currentLocationElement = modalContent.querySelector("#current-location");
            if (currentLocationElement) {
                currentLocationElement.textContent = "현재위치: " + newLocation + ". 클릭한 위치의 위도는 " + newLatitude + "이고, 경도는 " + newLongitude + "입니다.";
            } else {
                const newLocationElement = document.createElement("div");
                newLocationElement.id = "current-location";
                newLocationElement.textContent = "현재위치: " + newLocation + ". 클릭한 위치의 위도는 " + newLatitude + "이고, 경도는 " + newLongitude + "입니다.";
                modalContent.appendChild(newLocationElement);
            }
        });

        kakao.maps.event.addListener(map, "idle", function () {
          searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        });

        function searchAddrFromCoords(coords, callback) {
          geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        }

        function searchDetailAddrFromCoords(coords, callback) {
          geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

        function displayCenterInfo(result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById("centerAddr");

            for (var i = 0; i < result.length; i++) {
              if (result[i].region_type === "H") {
                infoDiv.innerHTML = result[i].address_name;
                break;
              }
            }
          }
        }
      }

      function error() {
        const status = document.querySelector("#status");
        status.textContent = "확인되지 않은 위치입니다.";
      }

      function geoFindMe() {
        const status = document.querySelector("#status");
        const mapLink = document.querySelector("#map-link");

        mapLink.href = "";
        mapLink.textContent = "";

        if (!navigator.geolocation) {
          status.textContent = "";
        } else {
          status.textContent = "";
          navigator.geolocation.getCurrentPosition(success, error);
        }
      }

      function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
        const R = 6371;
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a =
          Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c;
        return d;
      }

      function deg2rad(deg) {
        return deg * (Math.PI / 180);
      }

      function checkLocation(latitude, longitude) {
        let minDistance = Infinity;
        let closestLocations = [];
        const locationsWithinRange = [];
        const locations = [
          // 서울시
          {
            loc_code: "서울시",
            detail_loc: "강남구",
            latitude: 37.5172,
            longitude: 127.0473,
          },
          {
            loc_code: "서울시",
            detail_loc: "강서구",
            latitude: 37.5509,
            longitude: 126.8497,
          },
          {
            loc_code: "서울시",
            detail_loc: "강동구",
            latitude: 37.5618,
            longitude: 127.0371,
          },
          {
            loc_code: "서울시",
            detail_loc: "강북구",
            latitude: 37.646995,
            longitude: 127.014716,
          },
          {
            loc_code: "서울시",
            detail_loc: "관악구",
            latitude: 37.4782,
            longitude: 126.9517,
          },
          {
            loc_code: "서울시",
            detail_loc: "광진구",
            latitude: 37.5485,
            longitude: 127.0859,
          },
          {
            loc_code: "서울시",
            detail_loc: "구로구",
            latitude: 37.4952,
            longitude: 126.8581,
          },
          {
            loc_code: "서울시",
            detail_loc: "금천구",
            latitude: 37.4573,
            longitude: 126.9019,
          },
          {
            loc_code: "서울시",
            detail_loc: "노원구",
            latitude: 37.6542,
            longitude: 127.0568,
          },
          {
            loc_code: "서울시",
            detail_loc: "도봉구",
            latitude: 37.6688,
            longitude: 127.0471,
          },
          {
            loc_code: "서울시",
            detail_loc: "동대문구",
            latitude: 37.5812,
            longitude: 127.0547,
          },
          {
            loc_code: "서울시",
            detail_loc: "동작구",
            latitude: 37.4964,
            longitude: 126.9443,
          },
          {
            loc_code: "서울시",
            detail_loc: "마포구",
            latitude: 37.5665,
            longitude: 126.9018,
          },
          {
            loc_code: "서울시",
            detail_loc: "서대문구",
            latitude: 37.5791,
            longitude: 126.9368,
          },
          {
            loc_code: "서울시",
            detail_loc: "서초구",
            latitude: 37.4837,
            longitude: 127.0324,
          },
          {
            loc_code: "서울시",
            detail_loc: "성동구",
            latitude: 37.5635,
            longitude: 127.0365,
          },
          {
            loc_code: "서울시",
            detail_loc: "성북구",
            latitude: 37.6066,
            longitude: 127.0237,
          },
          {
            loc_code: "서울시",
            detail_loc: "송파구",
            latitude: 37.5145,
            longitude: 127.1058,
          },
          {
            loc_code: "서울시",
            detail_loc: "양천구",
            latitude: 37.5169,
            longitude: 126.866,
          },
          {
            loc_code: "서울시",
            detail_loc: "영등포구",
            latitude: 37.5255,
            longitude: 126.8974,
          },
          {
            loc_code: "서울시",
            detail_loc: "용산구",
            latitude: 37.5326,
            longitude: 126.9905,
          },
          {
            loc_code: "서울시",
            detail_loc: "은평구",
            latitude: 37.6171,
            longitude: 126.928,
          },
          {
            loc_code: "서울시",
            detail_loc: "종로구",
            latitude: 37.5704,
            longitude: 126.9922,
          },
          {
            loc_code: "서울시",
            detail_loc: "중구",
            latitude: 37.5642,
            longitude: 126.9975,
          },
          {
            loc_code: "서울시",
            detail_loc: "중랑구",
            latitude: 37.6066,
            longitude: 127.0927,
          },

          // 제주도
          {
            loc_code: "제주도",
            detail_loc: "제주시",
            latitude: 33.4996,
            longitude: 126.5312,
          },
          {
            loc_code: "제주도",
            detail_loc: "서귀포시",
            latitude: 33.2542,
            longitude: 126.5603,
          },

          // 경기도
          {
            loc_code: "경기도",
            detail_loc: "수원",
            latitude: 37.2636,
            longitude: 127.0286,
          },
          {
            loc_code: "경기도",
            detail_loc: "성남",
            latitude: 37.4386,
            longitude: 127.1378,
          },
          {
            loc_code: "경기도",
            detail_loc: "용인",
            latitude: 37.241086,
            longitude: 127.177555,
          },
          {
            loc_code: "경기도",
            detail_loc: "부천",
            latitude: 37.5032,
            longitude: 126.7667,
          },
          {
            loc_code: "경기도",
            detail_loc: "안산",
            latitude: 37.3217,
            longitude: 126.8309,
          },
          {
            loc_code: "경기도",
            detail_loc: "고양",
            latitude: 37.658,
            longitude: 126.8326,
          },
          {
            loc_code: "경기도",
            detail_loc: "의정부",
            latitude: 37.7437,
            longitude: 127.0413,
          },
          {
            loc_code: "경기도",
            detail_loc: "광명",
            latitude: 37.4794,
            longitude: 126.8646,
          },

          // 충청도
          {
            loc_code: "충청도",
            detail_loc: "대전",
            latitude: 36.3504,
            longitude: 127.3845,
          },
          {
            loc_code: "충청도",
            detail_loc: "천안",
            latitude: 36.8151,
            longitude: 127.1135,
          },
          {
            loc_code: "충청도",
            detail_loc: "아산",
            latitude: 36.7926,
            longitude: 127.0018,
          },
          {
            loc_code: "충청도",
            detail_loc: "공주",
            latitude: 36.5633,
            longitude: 127.2564,
          },
          {
            loc_code: "충청도",
            detail_loc: "논산",
            latitude: 36.1977,
            longitude: 127.1002,
          },
          {
            loc_code: "충청도",
            detail_loc: "보령",
            latitude: 36.3494,
            longitude: 126.6032,
          },
          {
            loc_code: "충청도",
            detail_loc: "서산",
            latitude: 36.7763,
            longitude: 126.4509,
          },

          // 경상도
          {
            loc_code: "경상도",
            detail_loc: "부산",
            latitude: 35.1796,
            longitude: 129.0756,
          },
          {
            loc_code: "경상도",
            detail_loc: "대구",
            latitude: 35.8714,
            longitude: 128.6014,
          },
          {
            loc_code: "경상도",
            detail_loc: "울산",
            latitude: 35.5384,
            longitude: 129.3114,
          },
          {
            loc_code: "경상도",
            detail_loc: "창원",
            latitude: 35.2322,
            longitude: 128.6811,
          },
          {
            loc_code: "경상도",
            detail_loc: "포항",
            latitude: 36.0199,
            longitude: 129.341,
          },
          {
            loc_code: "경상도",
            detail_loc: "진주",
            latitude: 35.1795,
            longitude: 128.1076,
          },
          {
            loc_code: "경상도",
            detail_loc: "김해",
            latitude: 35.2282,
            longitude: 128.8812,
          },

          // 전라도
          {
            loc_code: "전라도",
            detail_loc: "광주",
            latitude: 35.1595,
            longitude: 126.8526,
          },
          {
            loc_code: "전라도",
            detail_loc: "전주",
            latitude: 35.8468,
            longitude: 127.1297,
          },
          {
            loc_code: "전라도",
            detail_loc: "목포",
            latitude: 34.8124,
            longitude: 126.3922,
          },
          {
            loc_code: "전라도",
            detail_loc: "순천",
            latitude: 34.9477,
            longitude: 127.5047,
          },
          {
            loc_code: "전라도",
            detail_loc: "여수",
            latitude: 34.7604,
            longitude: 127.6622,
          },
          {
            loc_code: "전라도",
            detail_loc: "나주",
            latitude: 35.0128,
            longitude: 126.7193,
          },
          {
            loc_code: "전라도",
            detail_loc: "군산",
            latitude: 35.9756,
            longitude: 126.945,
          },

          // 강원도
          {
            loc_code: "강원도",
            detail_loc: "춘천",
            latitude: 37.8856,
            longitude: 127.7342,
          },
          {
            loc_code: "강원도",
            detail_loc: "원주",
            latitude: 37.3447,
            longitude: 127.9209,
          },
          {
            loc_code: "강원도",
            detail_loc: "강릉",
            latitude: 37.7519,
            longitude: 128.876,
          },
          {
            loc_code: "강원도",
            detail_loc: "속초",
            latitude: 38.207,
            longitude: 128.591,
          },
          {
            loc_code: "강원도",
            detail_loc: "동해",
            latitude: 37.7499,
            longitude: 129.3328,
          },
          {
            loc_code: "강원도",
            detail_loc: "태백",
            latitude: 37.1665,
            longitude: 128.9886,
          },
          {
            loc_code: "강원도",
            detail_loc: "삼척",
            latitude: 37.4449,
            longitude: 129.165,
          },
        ];

        const desiredRange = 3; // 변경하고자 하는 거리 범위 (단위: km)

        for (let location of locations) {
            const distance = getDistanceFromLatLonInKm(
                latitude,
                longitude,
                location.latitude,
                location.longitude
            );

            if (distance <= desiredRange) {
                locationsWithinRange.push(location); // 범위 내에 위치하면 배열에 추가
            }

            if (distance < minDistance) {
                minDistance = distance; // 가장 가까운 거리로 갱신
                closestLocations = [location];
            } else if (distance === minDistance) {
                closestLocations.push(location);
            }
        }

        if (locationsWithinRange.length > 0) {
            if (locationsWithinRange.length === 1) {
                return `${locationsWithinRange[0].loc_code} - ${locationsWithinRange[0].detail_loc}`;
            } else {
                let userChoice = prompt(
                    `여러 지역이 ${desiredRange}km 이내에 있습니다. 아래에서 선택해주세요:\n` +
                    `<c:forEach items="${locationsWithinRange}" var="loc" varStatus="status">` +
                    `'${status.index + 1}. ' + '${loc.loc_code} - ${loc.detail_loc}\n'` +
                    `</c:forEach>` +
                    ``
                );
                userChoice = parseInt(userChoice);
                if (userChoice && userChoice <= locationsWithinRange.length) {
                    return `${locationsWithinRange[userChoice - 1].loc_code} - ${locationsWithinRange[userChoice - 1].detail_loc}`;
                }
            }
        }

        return "해당 지역이 아닙니다.";
      }

      document.querySelector("#find-me").addEventListener("click", geoFindMe);
    </script>

	<script>
      // 모달 열기
      function openModal() {
        document.getElementById("myModal").style.display = "block";
      }

      // 모달 닫기
      function closeModal() {
        document.getElementById("myModal").style.display = "none";
      }

      // "Show my location" 버튼 클릭 시 모달 열기
      document.getElementById("find-me").addEventListener("click", function () {
         const statusContent = document.getElementById("status").outerHTML;
         const mapLinkContent = document.getElementById("map-link").outerHTML;
         const mapContent = document.getElementById("map").outerHTML;

         const content = statusContent + mapLinkContent + mapContent;
         const modalContent = document.getElementById("modal-content");

         while (modalContent.firstChild) {
           modalContent.removeChild(modalContent.firstChild);
         }

         const contentElement = document.createElement("div");
         contentElement.innerHTML = content;
         modalContent.appendChild(contentElement);

         openModal();
         geoFindMe();
      });
    </script>
</body>
</html>